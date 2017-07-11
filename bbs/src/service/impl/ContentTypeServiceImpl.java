package service.impl;

import dao.impl.ContentTypeDaoImpl;
import bean.ContentType;
import service.ContentTypeService;

public class ContentTypeServiceImpl implements ContentTypeService {

	public ContentType getContentTypeById(int id) {
		
		return new ContentTypeDaoImpl().getContentTypeById(id);
	}

}
