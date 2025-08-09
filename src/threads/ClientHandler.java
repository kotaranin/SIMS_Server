/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package threads;

import domain.*;
import enums.ResultType;
import java.io.IOException;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.*;
import controller.ServerController;

/**
 *
 * @author Uros
 */
public class ClientHandler extends Thread {

    private final Socket socket;
    private final Sender sender;
    private final Receiver receiver;
    private final ServerController serverController;
    private boolean end;

    public ClientHandler(Socket socket) throws IOException {
        this.socket = socket;
        this.sender = new Sender(socket);
        this.receiver = new Receiver(socket);
        this.serverController = ServerController.getInstance();
        this.end = false;
    }

    @Override
    public void run() {
        try {
            while (!end) {
                handleRequest((Request) receiver.receive());
            }
        } catch (ClassNotFoundException | IOException ex) {
            Logger.getLogger(ClientHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void handleRequest(Request request) throws IOException {
        Response response = new Response();
        switch (request.getOperation()) {
            case LOG_IN ->
                logIn(request, response);
            case GET_ALL_REPORTS ->
                getAllReports(request, response);
            case DELETE_REPORT ->
                deleteReport(request, response);
            case INSERT_REPORT ->
                insertReport(request, response);
            case UPDATE_REPORT ->
                updateReport(request, response);
            case SEARCH_REPORTS ->
                searchReports(request, response);
            case GET_ALL_COUNTRIES ->
                getAllCountries(request, response);
            case DELETE_COUNTRY ->
                deleteCountry(request, response);
            case INSERT_COUNTRY ->
                insertCountry(request, response);
            case UPDATE_COUNTRY ->
                updateCountry(request, response);
            case SEARCH_COUNTRIES ->
                searchCoountries(request, response);
            default ->
                throw new AssertionError();
        }
        sender.send(response);
    }

    public void disconnect() throws IOException {
        end = true;
        socket.close();
        sender.getOut().close();
        receiver.getIn().close();
    }

    private void logIn(Request request, Response response) {
        try {
            response.setArgument(serverController.logIn((StudentOfficer) request.getArgument()));
            response.setResultType(ResultType.SUCCESS);
        } catch (Exception ex) {
            response.setException(ex);
            response.setResultType(ResultType.FAIL);
        }
    }

    private void getAllReports(Request request, Response response) {
        try {
            response.setArgument(serverController.getAllReports());
            response.setResultType(ResultType.SUCCESS);
        } catch (Exception ex) {
            response.setException(ex);
            response.setResultType(ResultType.FAIL);
        }
    }

    private void deleteReport(Request request, Response response) {
        try {
            serverController.deleteReport((Report) request.getArgument());
            response.setResultType(ResultType.SUCCESS);
        } catch (Exception ex) {
            response.setException(ex);
            response.setResultType(ResultType.FAIL);
        }
    }

    private void insertReport(Request request, Response response) {
        try {
            serverController.insertReport((Report) request.getArgument());
            response.setResultType(ResultType.SUCCESS);
        } catch (Exception ex) {
            response.setException(ex);
            response.setResultType(ResultType.FAIL);
        }
    }

    private void updateReport(Request request, Response response) {
        try {
            serverController.updateReport((Report) request.getArgument());
            response.setResultType(ResultType.SUCCESS);
        } catch (Exception ex) {
            response.setException(ex);
            response.setResultType(ResultType.FAIL);
        }
    }

    private void searchReports(Request request, Response response) {
        try {
            response.setArgument(serverController.searchReports((String) request.getArgument()));
            response.setResultType(ResultType.SUCCESS);
        } catch (Exception ex) {
            response.setException(ex);
            response.setResultType(ResultType.FAIL);
        }
    }

    private void getAllCountries(Request request, Response response) {
        try {
            response.setArgument(serverController.getAllCountries());
            response.setResultType(ResultType.SUCCESS);
        } catch (Exception ex) {
            response.setException(ex);
            response.setResultType(ResultType.FAIL);
        }
    }

    private void deleteCountry(Request request, Response response) {
        try {
            serverController.deleteCountry((Country) request.getArgument());
            response.setResultType(ResultType.SUCCESS);
        } catch (Exception ex) {
            response.setException(ex);
            response.setResultType(ResultType.FAIL);
        }
    }

    private void insertCountry(Request request, Response response) {
        try {
            serverController.insertCountry((Country) request.getArgument());
            response.setResultType(ResultType.SUCCESS);
        } catch (Exception ex) {
            response.setException(ex);
            response.setResultType(ResultType.FAIL);
        }
    }

    private void updateCountry(Request request, Response response) {
        try {
            serverController.updateCountry((Country) request.getArgument());
            response.setResultType(ResultType.SUCCESS);
        } catch (Exception ex) {
            response.setException(ex);
            response.setResultType(ResultType.FAIL);
        }
    }

    private void searchCoountries(Request request, Response response) {
        try {
            response.setArgument(serverController.searchCountries((String) request.getArgument()));
            response.setResultType(ResultType.SUCCESS);
        } catch (Exception ex) {
            response.setException(ex);
            response.setResultType(ResultType.FAIL);
        }
    }

}
