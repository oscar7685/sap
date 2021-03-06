/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.InstrumentoFacade;
import com.sap.ejb.NumericadocumentalFacade;
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
public class ListarEvaluarNum implements Action {
    InstrumentoFacade instrumentoFacade = lookupInstrumentoFacadeBean();
    NumericadocumentalFacade numericadocumentalFacade = lookupNumericadocumentalFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso pro = (Proceso) sesion.getAttribute("Proceso");
        List<Numericadocumental> listaNum = numericadocumentalFacade.findByList2("procesoId", pro, "instrumentoId", instrumentoFacade.find(2));
        sesion.setAttribute("listaNum", listaNum);
        return "/WEB-INF/vista/comitePrograma/numericaDocumental/listarInfoNumerica.jsp";
    }

    private NumericadocumentalFacade lookupNumericadocumentalFacadeBean() {
        try {
            Context c = new InitialContext();
            return (NumericadocumentalFacade) c.lookup("java:global/sap/NumericadocumentalFacade!com.sap.ejb.NumericadocumentalFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private InstrumentoFacade lookupInstrumentoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (InstrumentoFacade) c.lookup("java:global/sap/InstrumentoFacade!com.sap.ejb.InstrumentoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
