<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <header>
      <nav class='navbar navbar-default navbar-fixed-top'>
        <a class='navbar-brand' href='admin/school.action'>
          <img width="51" height="21" class="logo" alt="Flatty" src="images/logo.png" />
          <img width="21" height="21" class="logo-xs" alt="Flatty" src="assets/images/logo_xs.svg" />
        </a>
        <a class='toggle-nav btn pull-left' href='#'>
          <i class='icon-reorder'></i>
        </a>
        <ul class='nav'>
          <li class='dropdown dark user-menu'>
            <a class='dropdown-toggle' data-toggle='dropdown' href='#'>
              <img width="23" height="23" alt="Mila Kunis" src="assets/images/avatar.jpg" />
              <span class='user-name'>${USER_CONTEXT.username}</span>
              <b class='caret'></b>
            </a>
            <ul class='dropdown-menu'>
              <!-- <li class='divider'></li> -->
              <li>
                <a href='admin/aloginout.action'>
                  <i class='icon-signout'></i>
                 	 退出
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </nav>
</header>