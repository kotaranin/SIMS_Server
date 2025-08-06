/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package threads;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Uros
 */
public class ServerThread extends Thread {

    private final int port;
    private ServerSocket serverSocket;
    private final List<ClientHandler> clients;
    private boolean end;

    public ServerThread(int port) throws IOException {
        this.port = port;
        this.clients = new LinkedList<>();
        this.end = false;
    }

    @Override
    public void run() {
        try {
            serverSocket = new ServerSocket(port);
            System.out.println("Server started!");
            while (!end) {
                Socket socket = serverSocket.accept();
                ClientHandler client = new ClientHandler(socket);
                clients.add(client);
                client.start();
                System.out.println("Client connected!");
            }
            System.out.println("Server stopped!");
        } catch (IOException ex) {
            Logger.getLogger(ServerThread.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void stopServer() throws IOException {
        end = true;
        for (ClientHandler client : clients) {
            client.disconnect();
        }
        serverSocket.close();
    }

}
