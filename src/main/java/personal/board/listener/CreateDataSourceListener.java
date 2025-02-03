package personal.board.listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

@WebListener
public class CreateDataSourceListener implements ServletContextListener {
    private static final Logger logger = LoggerFactory.getLogger(CreateDataSourceListener.class);
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try{
            Context context = new InitialContext();
            // "/board"는 context.xml 참고
            DataSource source = (DataSource)context.lookup(sce.getServletContext().getInitParameter("JNDI-ROOT")+"/board");
            sce.getServletContext().setAttribute("DataSource", source);
        } catch(NamingException e) {
            logger.error(e.getMessage());
        }
    }
}
