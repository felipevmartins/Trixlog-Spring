package br.com.trixlog.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import br.com.trixlog.model.Location;
import br.com.trixlog.model.Tag;

@Repository
public class TagDao extends GenericDao {

	public Tag get(int id) {
		Criteria criteria = session.getCurrentSession().createCriteria(Tag.class, "tag");
		
		criteria.add(Restrictions.eq("tag.id", id));
		return (Tag) criteria.uniqueResult();
	}
	
	public List<Tag> getList(Location location) {
		Criteria criteria = session.getCurrentSession().createCriteria(Tag.class, "tag");
		
		criteria.add(Restrictions.eq("tag.location", location));
		return criteria.list();
	}
}
