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
import com.sap.entity.Programa;
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
public class PreparedInfoNumerica implements Action {
    IndicadorFacade indicadorFacade = lookupIndicadorFacadeBean();
    NumericadocumentalFacade numericadocumentalFacade = lookupNumericadocumentalFacadeBean();
    InstrumentoFacade instrumentoFacade = lookupInstrumentoFacadeBean();

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Proceso p = (Proceso) sesion.getAttribute("Proceso");
        Modelo m2 = (Modelo) sesion.getAttribute("Modelo");
        Programa programa = p.getProgramaId();
        Instrumento ins = instrumentoFacade.find(2);
        List<Numericadocumental> listaNum = numericadocumentalFacade.findByList2("procesoId", p, "instrumentoId", ins);
       
        List<Indicador> listInXmodelo = indicadorFacade.findByList("modeloId", m2);
        List<Indicador> indicadoresNum = new ArrayList<Indicador>();

        for (Indicador indicador : listInXmodelo) {
            if (indicador.getInstrumentoList().contains(ins)) {
                indicadoresNum.add(indicador);
            }
        }
        sesion.setAttribute("programa", programa); // montamos en sesion el programa
        sesion.setAttribute("lisrInidicadorsNum", indicadoresNum); // son todos los que son numericos
        sesion.setAttribute("listaNum", listaNum);//son la numerica documental que ya estan en la tabla calificados
        
        if (m2.getId() != 5) {
            return "/WEB-INF/vista/comitePrograma/numericaDocumental/asignarInfoNumerica2.jsp";
        } else {
            return "/WEB-INF/vista/comitePrograma/numericaDocumental/asignarInfoNumericaFisica.jsp";
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

    private NumericadocumentalFacade lookupNumericadocumentalFacadeBean() {
        try {
            Context c = new InitialContext();
            return (NumericadocumentalFacade) c.lookup("java:global/sap/NumericadocumentalFacade!com.sap.ejb.NumericadocumentalFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    private IndicadorFacade lookupIndicadorFacadeBean() {
        try {
            Context c = new InitialContext();
            return (IndicadorFacade) c.lookup("java:global/sap/IndicadorFacade!com.sap.ejb.IndicadorFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
}
