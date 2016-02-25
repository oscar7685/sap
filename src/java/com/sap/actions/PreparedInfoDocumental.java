/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.ejb.IndicadorFacade;
import com.sap.ejb.InstrumentoFacade;
import com.sap.ejb.NumericadocumentalFacade;
import com.sap.entity.Indicador;
import com.sap.entity.Instrumento;
import com.sap.entity.Modelo;
import com.sap.entity.Numericadocumental;
import com.sap.entity.Proceso;
import com.sap.interfaz.Action;
import java.io.IOException;
import java.util.ArrayList;
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
public class PreparedInfoDocumental implements Action {
    IndicadorFacade indicadorFacade = lookupIndicadorFacadeBean();
    NumericadocumentalFacade numericadocumentalFacade = lookupNumericadocumentalFacadeBean();
    InstrumentoFacade instrumentoFacade = lookupInstrumentoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso p = (Proceso) sesion.getAttribute("Proceso");
        Modelo m2 = (Modelo) sesion.getAttribute("Modelo");
        
        Instrumento ins = instrumentoFacade.find(3);
        List<Numericadocumental> listaDoc = numericadocumentalFacade.findByList2("procesoId", p, "instrumentoId", ins);
        
        List<Indicador> listInXmodelo = indicadorFacade.findByList("modeloId", m2);
        List<Indicador> indicadoresDoc = new ArrayList<Indicador>();

        for (Indicador indicador : listInXmodelo) {
            if (indicador.getInstrumentoList().contains(ins)) {
                indicadoresDoc.add(indicador);
            }
        }
        sesion.setAttribute("lisrInidicadorsDoc", indicadoresDoc); // son todos los que son documentales
        sesion.setAttribute("listaDoc", listaDoc);//son los que ya estan en la tabla calificados
        return "/WEB-INF/vista/comitePrograma/numericaDocumental/asignarInfoDocumental2.jsp";
    }

    private InstrumentoFacade lookupInstrumentoFacadeBean() {
        try {
            Context c = new InitialContext();
            return (InstrumentoFacade) c.lookup("java:global/sapnaval/InstrumentoFacade!com.sap.ejb.InstrumentoFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private NumericadocumentalFacade lookupNumericadocumentalFacadeBean() {
        try {
            Context c = new InitialContext();
            return (NumericadocumentalFacade) c.lookup("java:global/sapnaval/NumericadocumentalFacade!com.sap.ejb.NumericadocumentalFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private IndicadorFacade lookupIndicadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (IndicadorFacade) c.lookup("java:global/sapnaval/IndicadorFacade!com.sap.ejb.IndicadorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
