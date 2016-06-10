/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.PonderacionfactorFacade;
import com.sap.entity.Factor;
import com.sap.entity.Ponderacionfactor;
import com.sap.entity.Proceso;
import com.sap.interfaz.Action;
import java.io.IOException;
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
public class PonderarFactor implements Action {

    PonderacionfactorFacade ponderacionfactorFacade = lookupPonderacionfactorFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        Ponderacionfactor pf = new Ponderacionfactor();
        List listFactor = (List) sesion.getAttribute("listFactor");
        Iterator it = listFactor.iterator();
        while (it.hasNext()) {
            Factor f = (Factor) it.next();
            Double ponderacion = Double.parseDouble(request.getParameter("ponderacion" + f.getId()));
            String justificacion = request.getParameter("justificacion" + f.getId());
            pf.setFactorId(f);
            pf.setJustificacion(justificacion);
            pf.setPonderacion(ponderacion);
            pf.setProcesoId(proceso);
            ponderacionfactorFacade.create(pf);
        }
        return "NA";
    }

    private PonderacionfactorFacade lookupPonderacionfactorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (PonderacionfactorFacade) c.lookup("java:global/sapenfermeria/PonderacionfactorFacade!com.sap.ejb.PonderacionfactorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
