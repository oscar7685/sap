/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.entity.Actividad;
import com.sap.interfaz.Action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author acreditacion
 */
public class CrearSeguimientoF implements Action {

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Actividad act = (Actividad) sesion.getAttribute("actividad");
        return "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/seguimientos/crearF.jsp";


    }
}
