package com3014.group8project;

import com3014.group8project.config.RootConfig;
import com3014.group8project.config.WebConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.context.support.XmlWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

/**
 * In this java class the Spring Web framework is registered and initialised.
 * Our app is configured with only Java classes and not XML.
 * @author Andreas Neokleous
 */
public class MainInitializer implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletCxt) throws ServletException {
        AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
        rootContext.register(RootConfig.class);

        servletCxt.addListener(new ContextLoaderListener(rootContext));
        
        AnnotationConfigWebApplicationContext mvcContext = new AnnotationConfigWebApplicationContext();
        mvcContext.register(WebConfig.class);

        // Create DispatcherServlet
        DispatcherServlet servlet = new DispatcherServlet(mvcContext);
        
        // Register and map the Servlet
        ServletRegistration.Dynamic registration = servletCxt.addServlet("appServlet", servlet);
        registration.setLoadOnStartup(1);
        registration.addMapping("/");

    }

}
