<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav id='main-nav'>
        <div class='navigation'>
          <div class='search'>
            <form action='search_results.html' method='get'>
              <div class='search-wrapper'>
                <input value="" class="search-query form-control" placeholder="Search..." autocomplete="off" name="q" type="text" />
                <button class='btn btn-link icon-search' name='button' type='submit'></button>
              </div>
            </form>
          </div>
          <ul class='nav nav-stacked'>
            <li class=''>
              <a href='admin/school.action'>
                <i class='icon-dashboard'></i>
                <span>控制台</span>
              </a>
            </li>
            <li>
              <a href='admin/school.action'>
                <i class='icon-cog'></i>
                <span>学校管理</span>
              </a>
            </li>
            <li>
              <a href='admin/category.action'>
                <i class='icon-star'></i>
                <span>实验分类管理</span>
              </a>
            </li>
            <li>
              <a href='admin/examcategory.action'>
                <i class='icon-star'></i>
                <span>试卷分类管理</span>
              </a>
            </li>
            <li>
              <a href='admin/groom.action'>
                <i class='icon-star'></i>
                <span>试卷推荐管理</span>
              </a>
            </li>
          </ul>
        </div>
      </nav>