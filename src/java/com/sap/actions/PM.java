/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.interfaz.Action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author acreditacion
 */
public class PM implements Action{

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        System.out.println("aqui estamos!!!!");
        return "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/vistaPreviaPlan.jsp";
    }
    
}
