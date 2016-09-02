/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.MuestraFacade;
import com.sap.ejb.ProcesoFacade;
import com.sap.entity.Muestra;
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
public class ListMuestra implements Action{
    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();
    MuestraFacade muestraFacade = lookupMuestraFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso proceso = (Proceso) sesion.getAttribute("Proceso");
        
        String url;
        List<Muestra> lm = muestraFacade.findByList("procesoId", proceso);

            Muestra m = null;
            if (!lm.isEmpty()) {
                Iterator i = lm.iterator();
                while (i.hasNext()) {
                    m = (Muestra) i.next();
                    sesion.setAttribute("Muestra", m);
                }
                url = "/WEB-INF/vista/comitePrograma/muestra/listarMuestra.jsp";
                } else {
                sesion.setAttribute("Muestra", m);
                url = "/WEB-INF/vista/comitePrograma/muestra/asignarMuestra.jsp";
                
            }
            return url;
    }

    private MuestraFacade lookupMuestraFacadeBean() {
        try {
            Context c = new InitialContext();
            return (MuestraFacade) c.lookup("java:global/sap/MuestraFacade!com.sap.ejb.MuestraFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private ProcesoFacade lookupProcesoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProcesoFacade) c.lookup("java:global/sap/ProcesoFacade!com.sap.ejb.ProcesoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
    
}
