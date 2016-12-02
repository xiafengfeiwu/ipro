package test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.pro.entity.Menu;
import com.pro.exception.DaoException;
import com.pro.service.MenuService;
import com.pro.util.PublicUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
@WebAppConfiguration
public class MenuServiceTest {

	public MenuServiceTest() {
	}

	@Autowired
	MenuService menuService;

	@Test
	public void TestMenuCreate() {
		Menu menu = new Menu();
		menu.setMenuId(PublicUtil.initId());
		menu.setMenuIcon("fa fa-home");
		menu.setMenuName("主页1");
		menu.setMenuUrl("home/index1");
		menu.setMenuOrder(10);
		menu.setMenuPid(803106763040620544l);
		try {
			menuService.save(menu);
		} catch (DaoException e) {
			System.out.println(e.getMessage());
		}
	}

	@Test
	public void TestMenuDelete() {
		try {
			menuService.delete(801661691782758400l);
		} catch (DaoException e) {
			System.out.println(e.getMessage());
		}
	}

	@Test
	public void TestInitMenuHtml() {
		System.out.println(PublicUtil.initMenuHtml(menuService.findAll()));
		System.out.println(PublicUtil.initMenuNestableHtml(menuService.findAll()));
	}

}
