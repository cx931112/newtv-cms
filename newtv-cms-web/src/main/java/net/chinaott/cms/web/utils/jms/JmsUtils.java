package net.chinaott.cms.web.utils.jms;

import lombok.extern.slf4j.Slf4j;
import org.apache.activemq.ActiveMQConnectionFactory;

import javax.jms.*;
import java.io.Serializable;

/**
 * Created by Neil on 2015-10-27.
 */
@Slf4j
public class JmsUtils {

    public static void publish(String jmsUserName, String jmsPwd, String jmsUrl, String topicName, Serializable message) {
        Connection connection = null;
        Session session = null;
        ActiveMQConnectionFactory connectionFactory = new ActiveMQConnectionFactory(jmsUserName, jmsPwd, jmsUrl);

        try {
            connection = connectionFactory.createConnection();
            connection.start();
            session = connection.createSession(true, 1);

            Topic topic = session.createTopic(topicName);

            MessageProducer producer = session.createProducer(topic);
            producer.setDeliveryMode(2);

            ObjectMessage e = session.createObjectMessage();
            e.setObject(message);

            producer.send(e);
            session.commit();
        } catch (Exception e) {
            log.error("Send JMS failed", e);
        } finally {
            try {
                if (null != connection) {
                    connection.close();
                }

                if (null != session) {
                    session.rollback();
                }
            } catch (Throwable e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        JmsUtils.publish("ysten", "ysten", "tcp://125.39.95.47:61616", "test.ysten.topic.programseries", "");
    }
}

