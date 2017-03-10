/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.InstrumentoFacade;
import com.sap.ejb.NumericadocumentalFacade;
import com.sap.ejb.ProcesoFacade;
import com.sap.entity.Numericadocumental;
import com.sap.entity.Proceso;
import com.sap.interfaz.Action;
import java.io.IOException;
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
public class ListarEvaluarDoc implements Action {
    ProcesoFacade procesoFacade = lookupProcesoFacadeBean();
    InstrumentoFacade instrumentoFacade = lookupInstrumentoFacadeBean();
    NumericadocumentalFacade numericadocumentalFacade = lookupNumericadocumentalFacadeBean();
    
    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso pro = (Proceso) sesion.getAttribute("Proceso");
        List<Numericadocumental> listaDoc = numericadocumentalFacade.findByList2("procesoId", pro, "instrumentoId", instrumentoFacade.find(3));
        sesion.setAttribute("listaDoc", listaDoc);
        
        Proceso proceso = procesoFacade.find(52);
        listaDoc = numericadocumentalFacade.findByList2("procesoId", proceso, "instrumentoId", instrumentoFacade.find(3));
        sesion.setAttribute("listaDoc2", listaDoc);
        return "/WEB-INF/vista/comitePrograma/numericaDocumental/listarInfoDocumental.jsp";
    }

    private NumericadocumentalFacade lookupNumericadocumentalFacadeBean() {
        try {
            Context c = new InitialContext();
            return (NumericadocumentalFacade) c.lookup("java:global/sapenfermeria/NumericadocumentalFacade!com.sap.ejb.NumericadocumentalFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private InstrumentoFacade lookupInstrumentoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (InstrumentoFacade) c.lookup("java:global/sapenfermeria/InstrumentoFacade!com.sap.ejb.InstrumentoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private ProcesoFacade lookupProcesoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProcesoFacade) c.lookup("java:global/sapenfermeria/ProcesoFacade!com.sap.ejb.ProcesoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
