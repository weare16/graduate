package com.mtecc.rdc.base;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanFactoryPostProcessor;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.support.BeanDefinitionRegistry;
import org.springframework.beans.factory.xml.ResourceEntityResolver;
import org.springframework.beans.factory.xml.XmlBeanDefinitionReader;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Component;
 
@Component
public class MteccContext implements BeanFactoryPostProcessor,
        BeanPostProcessor, ApplicationContextAware {
 
    protected static Logger logger = LoggerFactory.getLogger(MteccContext.class);
 
    private static ConfigurableApplicationContext applicationContext = null;
 
    private static ConfigurableListableBeanFactory beanFactory = null;
 
    public void setApplicationContext(ApplicationContext applicationContext)
            throws BeansException {
        MteccContext.applicationContext = (ConfigurableApplicationContext) applicationContext;
    }
 
    public static ConfigurableApplicationContext getApplicationContext() {
        return applicationContext;
    }
     
    public static ConfigurableListableBeanFactory getConfigurableListableBeanFactory() {
        return beanFactory;
    }
 
    public void postProcessBeanFactory(
            ConfigurableListableBeanFactory beanFactory) throws BeansException {
        MteccContext.beanFactory = beanFactory;
    }
 
    public Object postProcessBeforeInitialization(Object bean, String beanName)
            throws BeansException {
        return bean;
    }
 
    public Object postProcessAfterInitialization(Object bean, String beanName)
            throws BeansException {
        return bean;
    }
 
 
    public static void registerBean(String resource) {
        BeanDefinitionRegistry beanDefinitionRegistry = ((BeanDefinitionRegistry)getConfigurableListableBeanFactory());
 
        XmlBeanDefinitionReader definitionReader = new XmlBeanDefinitionReader(
                beanDefinitionRegistry);
 
        definitionReader.setResourceLoader(getApplicationContext());
        definitionReader.setEntityResolver(new ResourceEntityResolver(
                getApplicationContext()));
 
        definitionReader.setValidating(false);
        definitionReader.setValidationMode(XmlBeanDefinitionReader.VALIDATION_NONE);
         
        definitionReader.loadBeanDefinitions(new FileSystemResource(resource));
    }
 
    public static void unregisterBean(String beanName) {
        if (containsBean(beanName)) {
            BeanDefinitionRegistry beanDefinitionRegistry = ((BeanDefinitionRegistry)getConfigurableListableBeanFactory());
            beanDefinitionRegistry.removeBeanDefinition(beanName);
        }
    }
 
    public static boolean containsBean(String beanName) {
        return getConfigurableListableBeanFactory().containsBeanDefinition(beanName);
    }
}
