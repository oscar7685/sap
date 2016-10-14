/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.actions;

import com.sap.entity.Hallazgo;
import com.sap.interfaz.Action;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author acreditacion
 */
public class CrearActividad implements Action {

    @Override
    public String procesar(HttpServletRequest request) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        Hallazgo h = (Hallazgo) sesion.getAttribute("hallazgo");
        if (h.getTipo().equals("hallazgo")) {
            return "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/actividadH/crear.jsp";
        } else {
            return "/WEB-INF/vista/comitePrograma/proceso/planMejoramiento/actividadF/crear.jsp";
        }

    }
}
