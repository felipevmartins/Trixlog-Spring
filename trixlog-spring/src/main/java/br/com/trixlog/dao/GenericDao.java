package br.com.trixlog.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import br.com.trixlog.model.BaseModel;

public class GenericDao {

	@Autowired
	public SessionFactory session;

	public void salvar(BaseModel bm) {
		session.getCurrentSession().saveOrUpdate(bm);
	}

	public void deletar(BaseModel bm) {
		session.getCurrentSession().delete(bm);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<BaseModel> listarTodos(Class bm) {
		return session.getCurrentSession()
				.createQuery("from " + bm.getName() + " e").list();
	}

}
