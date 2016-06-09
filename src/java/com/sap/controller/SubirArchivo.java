/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sap.controller;

import com.sap.entity.Proceso;
import com.sap.utils.LectorXLSX;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

/**
 *
 * @author acreditacion
 */
public class SubirArchivo extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final Logger LOGGER = Logger.getLogger(cpController.class);

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession sesion = request.getSession();
        if (!ServletFileUpload.isMultipartContent(request)) {
            throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
        }

        ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
        PrintWriter writer = response.getWriter();

        response.setContentType("text/plain");


        List<FileItem> items;
        try {
            items = uploadHandler.parseRequest(request);
            for (FileItem item : items) {
                if (!item.isFormField()) {

                    FileItem actual = null;
                    actual = item;
                    String fileName = actual.getName();


                    String str = request.getSession().getServletContext().getRealPath("/WEB-INF/classes/com/sap/temp/");
                    fileName = "" + fileName;
                    // nos quedamos solo con el nombre y descartamos el path
                    File fichero = new File(str + "\\" + fileName);


                    try {
                        // escribimos el fichero colgando del nuevo path
                        actual.write(fichero);
                        Proceso pro = (Proceso) sesion.getAttribute("Proceso");
                        String fuente = (String) sesion.getAttribute("fuenteX");
                        LectorXLSX pb = new LectorXLSX(fichero, pro, response, fuente);

                        if (!pb.errorGlobal) {
                            //archivo que contiene los xls
                            File fichero1 = new File(str);
                            //lista de ficheros
                            String[] ficheros = fichero1.list();
                            String aux = "";
                            if (ficheros != null) {
                                for (int i = 0; i < ficheros.length; i++) {
                                    String elementos[] = ficheros[i].split("\\.");
                                    if (!aux.equals("")) {
                                        if (elementos[1].equals("pdf")) {
                                            aux += ",{\"name\":\"" + ficheros[i] + "\",\"size\":\"" + 2000 + "\",\"url\":\"/docenciaservicio/file/" + ficheros[i] + "\",\"thumbnailUrl\":\"/docenciaservicio/thumbnails/" + "pdf2.png" + "\",\"deleteUrl\":\"/docenciaservicio/Subir?file=" + ficheros[i] + "\",\"deleteType\":\"DELETE\",\"type\":\"" + elementos[1] + "\"}";
                                        } else {
                                            aux += ",{\"name\":\"" + ficheros[i] + "\",\"size\":\"" + 2000 + "\",\"url\":\"/docenciaservicio/file/" + ficheros[i] + "\",\"thumbnailUrl\":\"/docenciaservicio/thumbnails/" + ficheros[i] + "\",\"deleteUrl\":\"/docenciaservicio/Subir?file=" + ficheros[i] + "\",\"deleteType\":\"DELETE\",\"type\":\"" + elementos[1] + "\"}";
                                        }

                                    } else {
                                        if (elementos[1].equals("pdf")) {
                                            aux += "{\"name\":\"" + ficheros[i] + "\",\"size\":\"" + 2000 + "\",\"url\":\"/docenciaservicio/file/" + ficheros[i] + "\",\"thumbnailUrl\":\"/docenciaservicio/thumbnails/" + "pdf2.png" + "\",\"deleteUrl\":\"/docenciaservicio/Subir?file=" + ficheros[i] + "\",\"deleteType\":\"DELETE\",\"type\":\"" + elementos[1] + "\"}";
                                        } else {
                                            aux += "{\"name\":\"" + ficheros[i] + "\",\"size\":\"" + 2000 + "\",\"url\":\"/docenciaservicio/file/" + ficheros[i] + "\",\"thumbnailUrl\":\"/docenciaservicio/thumbnails/" + ficheros[i] + "\",\"deleteUrl\":\"/docenciaservicio/Subir?file=" + ficheros[i] + "\",\"deleteType\":\"DELETE\",\"type\":\"" + elementos[1] + "\"}";
                                        }
                                    }
                                }
                                writer.write("{\"files\":[" + aux + "]}");

                            }
                        }


                    } catch (Exception ex) {
                        LOGGER.error("ha ocurrido un error ", ex);
                    }

                }
            }
        } catch (FileUploadException ex) {
            LOGGER.error("ha ocurrido un error ", ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            java.util.logging.Logger.getLogger(SubirArchivo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            java.util.logging.Logger.getLogger(SubirArchivo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
