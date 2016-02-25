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
public class EditPonderarFactor implements Action {
    PonderacioncaracteristicaFacade ponderacioncaracteristicaFacade = lookupPonderacioncaracteristicaFacadeBean();
    PonderacionfactorFacade ponderacionfactorFacade = lookupPonderacionfactorFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        List listFactor2 = ponderacionfactorFacade.findByList("procesoId", proceso);

        Iterator it2 = listFactor2.iterator();

        while (it2.hasNext()) {
            Ponderacionfactor pf2 = (Ponderacionfactor) it2.next();
            Double ponderacion = Double.parseDouble(request.getParameter("ponderacion" + pf2.getId()));
            String justificacion = request.getParameter("justificacion" + pf2.getId());

            pf2.setJustificacion(justificacion);
            pf2.setPonderacion(ponderacion);
            ponderacionfactorFacade.edit(pf2);

            Factor f = pf2.getFactorId();

            List suma0 = f.getCaracteristicaList();

            Iterator i1 = suma0.iterator();

            double suma = 0;
            List<Ponderacioncaracteristica> listpondC = (List<Ponderacioncaracteristica>) sesion.getAttribute("listPonderacionCara");
            if (listpondC != null && listpondC.size() > 0) {
                while (i1.hasNext()) {
                    Caracteristica c = (Caracteristica) i1.next();
                    Ponderacioncaracteristica pc1;
                    pc1 = ponderacioncaracteristicaFacade.findBySingle2("caracteristicaId", c, "procesoId", proceso);
                    suma += pc1.getNivelimportancia();
                }

                Iterator i2 = suma0.iterator();

                while (i2.hasNext()) {
                    Caracteristica c = (Caracteristica) i2.next();
                    Ponderacioncaracteristica pc1 = ponderacioncaracteristicaFacade.findBySingle2("caracteristicaId", c, "procesoId", proceso);

                    double vi = pc1.getNivelimportancia();

                    //System.out.println("Ponderacion FActor: " + pf.getPonderacion());
                    double a = (100 * vi) / suma;
                    double b = ((pf2.getPonderacion() * a) / 100);

                    double r;

                    int decimalPlaces = 2;
                    BigDecimal bde = new BigDecimal(b);

                    // setScale is immutable
                    bde = bde.setScale(decimalPlaces, BigDecimal.ROUND_HALF_UP);
                    r = bde.doubleValue();

                    pc1.setPonderacion(r);
                    ponderacioncaracteristicaFacade.edit(pc1);
                }
            }

        }
        return "NA";
    }

    private PonderacionfactorFacade lookupPonderacionfactorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PonderacionfactorFacade) c.lookup("java:global/sapnaval/PonderacionfactorFacade!com.sap.ejb.PonderacionfactorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private PonderacioncaracteristicaFacade lookupPonderacioncaracteristicaFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PonderacioncaracteristicaFacade) c.lookup("java:global/sapnaval/PonderacioncaracteristicaFacade!com.sap.ejb.PonderacioncaracteristicaFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
