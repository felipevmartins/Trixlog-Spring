package br.com.trixlog.dao;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import br.com.trixlog.model.Location;

@Repository
public class LocationDao extends GenericDao{

	public Location get(int id) {
		Criteria criteria = session.getCurrentSession().createCriteria(Location.class, "location");
		
		criteria.add(Restrictions.eq("location.id", id));
		return (Location) criteria.uniqueResult();
	}

}
