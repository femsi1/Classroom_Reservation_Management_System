package test.com.em.controller; 

import org.junit.Test; 
import org.junit.Before; 
import org.junit.After;

/** 
* LoginController Tester. 
* 
* @author <Authors name> 
* @since <pre>5ÔÂ 4, 2023</pre> 
* @version 1.0 
*/ 
@ExtendWith(MockitoExtension.class)
public class LoginControllerTest {

    @InjectMocks
    private test.com.em.controller.LoginController underTest;

    @Before
public void before() throws Exception {

} 

@After
public void after() throws Exception { 
}

/**
* 
* Method: loginUI() 
* 
*/
@Test
public void testLoginUI() throws Exception {
    String viewName = underTest.loginUI();
    assertEquals("../../login", viewName);
}


/**
* 
* Method: login(Model model, User user, HttpServletRequest request) 
* 
*/ 
@Test
public void testLogin() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: registerUI() 
* 
*/ 
@Test
public void testRegisterUI() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: register(Model model, User user, HttpServletRequest request) 
* 
*/ 
@Test
public void testRegister() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: checkcode(Model model, HttpServletRequest request, HttpServletResponse response) 
* 
*/
@Test
public void testCheckcode() throws Exception {
//TODO: Test goes here...
}


} 
