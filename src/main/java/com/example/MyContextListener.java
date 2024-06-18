
/* the purpose of this configuration and listener class is to ensure that the abandoned connection 
 cleanup thread is stopped correctly when the web application is shutting down, thus promoting 
 proper resource management and avoiding potential issues.*/
package com.example;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

public class MyContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // Initialization logic if needed
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        AbandonedConnectionCleanupThread.checkedShutdown();
    }
    }


