package com.team.marketd.controller;

import static org.junit.Assert.assertNotNull;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.team.marketd.domain.CommentVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/java/RootConfig.class",
									"classpath : src/main/java/ServletConfig.class" })

public class CommentControllerTest {

	CommentController cc = new CommentController();
	
	@Test
	public void commentOneTest() {
		
		int cidx=1;
		
		CommentVo cv = cc.commentOne(cidx);
		
		
		
		assertNotNull(cv);
	}
	
}
