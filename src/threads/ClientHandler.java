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
                getAllReports(response);
            case DELETE_REPORT ->
                deleteReport(request, response);
            case INSERT_REPORT ->
                insertReport(request, response);
            case UPDATE_REPORT ->
                updateReport(request, response);
            case SEARCH_REPORTS ->
                searchReports(request, response);
            case GET_ALL_COUNTRIES ->
                getAllCountries(response);
            case INSERT_COUNTRY ->
                insertCountry(request, response);
            case UPDATE_COUNTRY ->
                updateCountry(request, response);
            case SEARCH_COUNTRIES ->
                searchCountries(request, response);
            case GET_ALL_EXAM_PERIODS ->
                getAllExamPeriods(response);
            case DELETE_EXAM_PERIOD ->
                deleteExamPeriod(request, response);
            case INSERT_EXAM_PERIOD ->
                insertExamPeriod(request, response);
            case UPDATE_EXAM_PERIOD ->
                updateExamPeriod(request, response);
            case SEARCH_EXAM_PERIODS ->
                searchExamPeriod(request, response);
            case GET_ALL_TEACHERS ->
                getAllTeachers(response);
            case DELETE_TEACHER ->
                deleteTeacher(request, response);
            case INSERT_TEACHER ->
                insertTeacher(request, response);
            case UPDATE_TEACHER ->
                updateTeacher(request, response);
            case SEARCH_TEACHERS ->
                searchTeachers(request, response);
            case GET_ALL_STUDY_LEVELS ->
                getAllStudyLevels(response);
            case INSERT_STUDY_LEVEL ->
                insertStudyLevel(request, response);
            case UPDATE_STUDY_LEVEL ->
                updateStudyLevel(request, response);
            case SEARCH_STUDY_LEVEL ->
                searchStudyLevel(request, response);
            case GET_ALL_CITIES ->
                getAllCities(request, response);
            case GET_ALL_STUDY_PROGRAMS ->
                getAllStudyPrograms(request, response);
            case GET_ALL_MODULES ->
                getAllModules(request, response);
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

    private void executeWithResult(Response response, Supplier supplier) {
        try {
            response.setArgument(supplier.get());
            response.setResultType(ResultType.SUCCESS);
        } catch (Exception ex) {
            response.setException(ex);
            response.setResultType(ResultType.FAIL);
        }
    }

    private void executeWithoutResult(Response response, Action action) {
        try {
            action.run();
            response.setResultType(ResultType.SUCCESS);
        } catch (Exception ex) {
            response.setException(ex);
            response.setResultType(ResultType.FAIL);
        }
    }

    private void logIn(Request request, Response response) {
        executeWithResult(response, () -> serverController.logIn((StudentOfficer) request.getArgument()));
    }

    private void getAllReports(Response response) {
        executeWithResult(response, () -> serverController.getAllReports());
    }

    private void deleteReport(Request request, Response response) {
        executeWithoutResult(response, () -> serverController.deleteReport((Report) request.getArgument()));
    }

    private void insertReport(Request request, Response response) {
        executeWithoutResult(response, () -> serverController.insertReport((Report) request.getArgument()));
    }

    private void updateReport(Request request, Response response) {
        executeWithoutResult(response, () -> serverController.updateReport((Report) request.getArgument()));
    }

    private void searchReports(Request request, Response response) {
        executeWithResult(response, () -> serverController.searchReports((String) request.getArgument()));
    }

    private void getAllCountries(Response response) {
        executeWithResult(response, () -> serverController.getAllCountries());
    }

    private void insertCountry(Request request, Response response) {
        executeWithoutResult(response, () -> serverController.insertCountry((Country) request.getArgument()));
    }

    private void updateCountry(Request request, Response response) {
        executeWithoutResult(response, () -> serverController.updateCountry((Country) request.getArgument()));
    }

    private void searchCountries(Request request, Response response) {
        executeWithResult(response, () -> serverController.searchCountries((String) request.getArgument()));
    }

    private void getAllExamPeriods(Response response) {
        executeWithResult(response, () -> serverController.getAllExamPeriods());
    }

    private void deleteExamPeriod(Request request, Response response) {
        executeWithoutResult(response, () -> serverController.deleteExamPeriod(((ExamPeriod) request.getArgument())));
    }

    private void insertExamPeriod(Request request, Response response) {
        executeWithoutResult(response, () -> serverController.insertExamPeriod((ExamPeriod) request.getArgument()));
    }

    private void updateExamPeriod(Request request, Response response) {
        executeWithoutResult(response, () -> serverController.updateExamPeriod((ExamPeriod) request.getArgument()));
    }

    private void searchExamPeriod(Request request, Response response) {
        executeWithResult(response, () -> serverController.searchExamPeriods((String) request.getArgument()));
    }

    private void getAllTeachers(Response response) {
        executeWithResult(response, () -> serverController.getAllTeachers());
    }

    private void deleteTeacher(Request request, Response response) {
        executeWithoutResult(response, () -> serverController.deleteTeacher((Teacher) request.getArgument()));
    }

    private void insertTeacher(Request request, Response response) {
        executeWithoutResult(response, () -> serverController.insertTeacher((Teacher) request.getArgument()));
    }

    private void updateTeacher(Request request, Response response) {
        executeWithoutResult(response, () -> serverController.updateTeacher((Teacher) request.getArgument()));
    }

    private void searchTeachers(Request request, Response response) {
        executeWithResult(response, () -> serverController.searchTeachers((String) request.getArgument()));
    }

    private void getAllStudyLevels(Response response) {
        executeWithResult(response, () -> serverController.getAllStudyLevels());
    }

    private void insertStudyLevel(Request request, Response response) {
        executeWithoutResult(response, () -> serverController.insertStudyLevel((StudyLevel) request.getArgument()));
    }

    private void updateStudyLevel(Request request, Response response) {
        executeWithoutResult(response, () -> serverController.updateStudyLevel((StudyLevel) request.getArgument()));
    }

    private void searchStudyLevel(Request request, Response response) {
        executeWithResult(response, () -> serverController.searchStudyLevels((String) request.getArgument()));
    }

    private void getAllCities(Request request, Response response) {
        executeWithResult(response, () -> serverController.getAllCities((Country) request.getArgument()));
    }

    private void getAllStudyPrograms(Request request, Response response) {
        executeWithResult(response, () -> serverController.getAllStudyPrograms((StudyLevel) request.getArgument()));
    }

    private void getAllModules(Request request, Response response) {
        executeWithResult(response, () -> serverController.getAllModules((StudyProgram) request.getArgument()));
    }

    @FunctionalInterface
    private interface Supplier<T> {

        T get() throws Exception;
    }

    @FunctionalInterface
    private interface Action {

        void run() throws Exception;
    }

}
