/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package threads;

import java.io.IOException;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.*;

/**
 *
 * @author Uros
 */
public class ClientHandler extends Thread {

    private final Socket socket;
    private final Sender sender;
    private final Receiver receiver;
    private boolean end;

    public ClientHandler(Socket socket) throws IOException {
        this.socket = socket;
        this.sender = new Sender(socket);
        this.receiver = new Receiver(socket);
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
            case LOG_IN:

                break;
            default:
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

}
