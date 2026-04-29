package com.medicare.thread;

public class AppointmentReminderThread extends Thread {
    private boolean running = true;

    @Override
    public void run() {
        while (running) {
            try {
                // In a real application, check DB for appointments in the next 24 hours
                System.out.println("[Reminder Thread] Checking for upcoming appointments...");
                
                // Sleep for 1 hour before checking again (for demonstration, set to 10 seconds)
                Thread.sleep(10000);
            } catch (InterruptedException e) {
                System.out.println("Reminder Thread interrupted.");
                running = false;
            }
        }
    }

    public void stopThread() {
        this.running = false;
    }
}
