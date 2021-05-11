/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.se.onetomany.dao;

import com.se.onetomany.entity.CreditCard;
import com.se.onetomany.entity.Person;
import com.se.onetomany.util.SortUtils;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author TriPham
 */

@Repository
public class PersonDAOImpl implements PersonDAO {
     @Autowired
    private SessionFactory sessionFactory;
    
      @Override
        public Person getPerson(int thePersonId)
        {
            // get the current hibernate session
            Session currentSession = sessionFactory.getCurrentSession();
            // now retrieve/read from database using the primary key
            Person thePerson = currentSession.get(Person.class, thePersonId);
            return thePerson;
        }
        @Transactional
        @Override
        public List<Person> getPersons()
        {
            Session currentSession = sessionFactory.getCurrentSession();
            Query<Person> theQuery = 
                currentSession.createQuery("from Person order by lastName", Person.class);
            // execute query and get result list
            List<Person> persons = theQuery.getResultList();
            return persons;
        }
            @Override
          public void savePerson(Person thePerson)
        {
             // get current hibernate session
            Session currentSession = sessionFactory.getCurrentSession();
            // save/upate the customer ... finally
            currentSession.saveOrUpdate(thePerson);
        }
//          @Override
//        public void updatePerson(Person thePerson)
//        {
//             // get current hibernate session
//            Session currentSession = sessionFactory.getCurrentSession();
//            // save/upate the customer ... finally
//            currentSession.update(thePerson);
//        }
        @Override
        public List<CreditCard> getCreditCards(int thePersonId)
        {
           //Session currentSession = sessionFactory.getCurrentSession();
            Person thePerson = getPerson(thePersonId);
            List<CreditCard> creditCards =thePerson.getCreditCards();
            return creditCards;
        }
         @Override
         public CreditCard getCreditCard(int  personId, int creditCardId){
          Person thePerson = getPerson(personId);
          if(thePerson!=null)
             return thePerson.getCreditCard(creditCardId);
          else
            return null;    
         }
         @Override
        public void deletePerson(int thePersonId)
        {
            // get the current hibernate session
            Session currentSession = sessionFactory.getCurrentSession();
            Person tempPerson = currentSession.get(Person.class, thePersonId);
            currentSession.delete(tempPerson);


        }
  
  
//    
    @Transactional
    @Override
    public List<Person> getPersons(int theSortField) {
       // get the current hibernate session
			 Session currentSession = sessionFactory.getCurrentSession();	
		// determine sort field
		String theFieldName = null;
		
		switch (theSortField) {
                        case SortUtils.ID: 
				theFieldName = "id";
				break;
			case SortUtils.FIRST_NAME: 
				theFieldName = "firstName";
				break;
			case SortUtils.LAST_NAME:
				theFieldName = "lastName";
				break;
			case SortUtils.Money:
				theFieldName = "money";
				break;
			default:
				// if nothing matches the default to sort by lastName
				theFieldName = "id";
		}
		
		// create a query  
		String queryString = "from Person order by " + theFieldName;
		Query<Person> theQuery = 
				currentSession.createQuery(queryString, Person.class);
		
		// execute query and get result list
		List<Person> persons = theQuery.getResultList();
				
		// return the results		
		return persons;
    }
}
