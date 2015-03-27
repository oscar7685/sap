/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.PonderacioncaracteristicaFacade;
import com.sap.ejb.PonderacionfactorFacade;
import com.sap.entity.Caracteristica;
import com.sap.entity.Factor;
import com.sap.entity.Ponderacioncaracteristica;
import com.sap.entity.Ponderacionfactor;
import com.sap.entity.Proceso;
import com.sap.interfaz.Action;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author acreditacion
 */
public class EditPonderarCara implements Action {
    PonderacionfactorFacade ponderacionfactorFacade = lookupPonderacionfactorFacadeBean();
    PonderacioncaracteristicaFacade ponderacioncaracteristicaFacade = lookupPonderacioncaracteristicaFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        List listCara = ponderacioncaracteristicaFacade.findByList("procesoId", proceso);

        Iterator i = listCara.iterator();

        while (i.hasNext()) {

            Ponderacioncaracteristica pc = (Ponderacioncaracteristica) i.next();
            Float importancia = Float.parseFloat(request.getParameter("importancia" + pc.getId()));
            //Double ponderacion = Double.parseDouble(request.getParameter("ponderacion" + pc.getId()));
            String justificacion = request.getParameter("justificacion" + pc.getId());

            pc.setJustificacion(justificacion);
            pc.setNivelimportancia(importancia);
            //   pc.setPonderacion(ponderacion);

            ponderacioncaracteristicaFacade.edit(pc);
        }

        List lpc = ponderacioncaracteristicaFacade.findByList("procesoId", proceso);

        i = lpc.iterator();

        while (i.hasNext()) {
            Ponderacioncaracteristica pc = (Ponderacioncaracteristica) i.next();

            double vi = pc.getNivelimportancia();

            Factor f = pc.getCaracteristicaId().getFactorId();

            Ponderacionfactor pf = ponderacionfactorFacade.findBySingle2("factorId", f, "procesoId", proceso);

            List suma0 = f.getCaracteristicaList();

            Iterator i1 = suma0.iterator();

            double suma = 0;

            while (i1.hasNext()) {
                Caracteristica c = (Caracteristica) i1.next();
                Ponderacioncaracteristica pc1 = ponderacioncaracteristicaFacade.findBySingle2("caracteristicaId", c, "procesoId", proceso);
                suma += pc1.getNivelimportancia();
                //  System.out.println("Factor Id: " + f.getCodigo());
                //  System.out.println("Caracteristica Id: " + c.getCodigo());
            }

            //System.out.println("Suma: " + suma);
            double a = (100 * vi) / suma;
            double b = ((pf.getPonderacion() * a) / 100);

            double r;

            int decimalPlaces = 2;
            BigDecimal bde = new BigDecimal(b);

// setScale is immutable
            bde = bde.setScale(decimalPlaces, BigDecimal.ROUND_HALF_UP);
            r = bde.doubleValue();

            pc.setPonderacion(r);

            ponderacioncaracteristicaFacade.edit(pc);

        }
        return "NA";
    }

    private PonderacioncaracteristicaFacade lookupPonderacioncaracteristicaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PonderacioncaracteristicaFacade) c.lookup("java:global/sap/PonderacioncaracteristicaFacade!com.sap.ejb.PonderacioncaracteristicaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private PonderacionfactorFacade lookupPonderacionfactorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PonderacionfactorFacade) c.lookup("java:global/sap/PonderacionfactorFacade!com.sap.ejb.PonderacionfactorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
