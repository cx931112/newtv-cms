package net.chinaott.cms.web.module.system.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import net.chinaott.cms.core.system.entity.Button;
import net.chinaott.cms.core.system.entity.SysMenu;
import net.chinaott.cms.core.system.entity.SystemDic;
import net.chinaott.cms.web.common.constant.Constant;
import net.chinaott.cms.web.common.web.SystemBasicController;
import net.chinaott.cms.web.log.entity.OperationType;
import net.chinaott.cms.web.module.account.service.ShiroDbRealm.ShiroUser;
import net.chinaott.cms.web.module.log.service.OperationLogService;
import net.chinaott.cms.web.utils.permission.TagOrSessionConstants;
import net.chinaott.cms.web.utils.permission.UserSessionManager;
import net.chinaott.cms.web.utils.web.HttpResult;
import net.chinaott.cms.web.utils.web.HttpStatus;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 
 * List page : GET /task/ Create page : GET /task/create Create action : POST
 * /task/create Update page : GET /task/update/{id} Update action : POST
 * /task/update Delete action : GET /task/delete/{id}
 * 
 * @author mahc
 */
@Controller
@RequestMapping(value = "/sysMenu")
public class SysMenuController extends SystemBasicController {
	/**
	 * 日志
	 */
	private static final Logger LOGGER = LoggerFactory
			.getLogger(SysMenuController.class);

	@Autowired
	private OperationLogService operationLogService;

	/**
	 * <查询菜单信息>
	 * 
	 * @param request
	 * @param response
	 * @throws javax.servlet.ServletException
	 * @throws java.io.IOException
	 */
	@RequestMapping(value = "menuList")
	public String menuList(Model model, ServletRequest request) {
		try {
		} catch (Exception e) {
			LOGGER.error("Inner func[menuList]."
					+ " catch exception while get Role list ", e);
		}
		return "manager/menu/menuList";
	}

	// @RequestMapping(value = "menuList")
	// protected void menuList(HttpServletRequest request,
	// HttpServletResponse response) throws ServletException, IOException {
	//
	// String qrtext = request.getParameter("qrtext");
	//
	// System.out.print("-----------");
	//
	//
	//
	// ByteArrayOutputStream out = QRCode.from("weixin：//wxpay/s/An4baqw").to(
	// ImageType.PNG).stream();
	//
	// response.setContentType("image/png");
	// response.setContentLength(out.size());
	//
	// OutputStream outStream = response.getOutputStream();
	//
	// outStream.write(out.toByteArray());
	//
	// outStream.flush();
	// outStream.close();
	//
	// }

	@RequestMapping(value = "menuListById")
	@ResponseBody
	public List<SysMenu> menuListById(ServletRequest request,
			@RequestParam(value = "id", defaultValue = "0") Long id) {
		List<SysMenu> firstMenuList = sysMenuService.getMenuByParentId(id);
		return firstMenuList;
	}

	/**
	 * <进入菜单添加页面>
	 * 
	 * @return
	 */
	@RequestMapping(value = "add/{id}")
	public String addMenu(@PathVariable("id") Long menuId, ModelMap model) {
		List<SysMenu> menuList = new ArrayList<SysMenu>();
		menuList = sysMenuService.getMenuByParentId(menuId);
		model.addAttribute("menuList", menuList);
		// flag标识:0标识add,1标识edit
		int flag = 0;
		model.addAttribute("flag", flag);
		return "manager/menu/menuInfo";
	}

	/**
	 * <进入编辑页面>
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "edit/{id}")
	public String editInfo(@PathVariable Long id, ModelMap model) {
		SysMenu menu = new SysMenu();
		try {
			menu = sysMenuService.getMenuById(id);
			Long parentId = menu.getParentId();
			List<SysMenu> menuList = new ArrayList<SysMenu>();
			if (sysMenuService.getMenuById(id).getParentId() != 0) {
				// 获取父菜单及父菜单的兄弟菜单
				menuList = sysMenuService.getMenuByParentId(sysMenuService
						.getMenuById(
								sysMenuService.getMenuById(id).getParentId())
						.getParentId());
			}
			// flag标识:0标识add,1标识edit
			int flag = 1;
			model.addAttribute("menu", menu);
			model.addAttribute("menuList", menuList);
			model.addAttribute("parentId", parentId);
			model.addAttribute("flag", flag);
		} catch (Exception e) {
			LOGGER.error("Enter func[editInfo] catch exception " + e);
		}

		return "manager/menu/menuInfo";
	}

	/**
	 * <保存 菜单>
	 * 
	 * @param menu
	 * @param model
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "saveMenu")
	@ResponseBody
	public HttpResult saveMenu(@Valid @ModelAttribute("menu") SysMenu menu,
			ModelMap model, HttpServletRequest request,
			HttpServletResponse response) {
		HttpResult result = new HttpResult();
		Integer sort = 0;
		Integer sourceSort = 0;
		boolean updateSort = false;
		Long parentId = null;
		SysMenu sysMenu = new SysMenu();
		try {
			OperationType oprType;
			if (null != menu.getId()) {
				updateSort = true;
				sysMenu = sysMenuService.getMenuById(menu.getId());
				parentId = sysMenu.getParentId();
				sourceSort = sysMenu.getSort();
			}
			if (menu.getParentId() == null) {
				menu.setParentId(0L);
			}
			if (menu.getSort() == null || 0 == menu.getSort()) {
				sort = sysMenuService.getMaxSortNumByParentId(menu
						.getParentId());
				if (menu.getParentId() == null
						|| (!menu.getParentId().equals(parentId))) {
					sort = (null == sort) ? 1 : ++sort;
				} else {
					sort = sourceSort;
				}
				menu.setSort(sort);
			}
			sysMenuService.saveMenu(menu);
			if (updateSort) {
				oprType = OperationType.MODIFY;
			} else {
				oprType = OperationType.ADD;
			}
			// 更新 原parentId的 顺序
			if (updateSort && (menu.getParentId() != parentId)) {
				sysMenuService.updateMenu(parentId, sourceSort);
			}
			result.setResult(HttpStatus.OK);
			// 写入操作日志
			operationLogService.logOptAsync(oprType,
					String.valueOf(menu.getId()), Constant.OPRDATATYPE_MENU,
					getCurrentUser().id.longValue());
		} catch (Exception e) {
			result.setResult("300", "操作失败");
			LOGGER.error("Enter func[saveMenu] catch exception", e);
		}
		return result;

	}

	/**
	 * <删除menu>
	 * 
	 * @param response
	 * @param request
	 */
	@RequestMapping(value = "delete/{id}")
	@ResponseBody
	public HttpResult deleteById(@PathVariable Long id,
			HttpServletResponse response, HttpServletRequest request) {
		HttpResult result = new HttpResult();

		try {
			// 获得当前菜单
			SysMenu menu = sysMenuService.getMenuById(id);
			// 当前菜单为一级菜单
			if (menu.getParentId() == 0) {
				List<SysMenu> menus = new ArrayList<SysMenu>();
				menus = sysMenuService.getMenuByParentId(id);
				// 当前一级菜单包含子菜单时,删除当前菜单,子菜单,菜单与角色关系.子菜单按钮,子菜单按钮与角色关系
				if (null != menus) {
					for (SysMenu chileMenu : menus) {
						if (chileMenu.getChildButton().size() != 0) {
							List<Button> buttons = new ArrayList<Button>();
							buttons = chileMenu.getChildButton();
							for (Button button : buttons) {
								// 删除按钮,按钮与角色关系
								buttonService.deleteButtonByButtonCode(button
										.getButtonCode());
							}
						}
						// 删除菜单,菜单与角色关系
						sysMenuService.deleteMenuById(chileMenu.getId());
					}
				}
				// 删除一级菜单,菜单与角色关系
				sysMenuService.deleteMenuById(id);
			}
			// 当前菜单非一级菜单
			else {
				if (menu.getChildButton().size() != 0) {
					List<Button> buttons = new ArrayList<Button>();
					buttons = menu.getChildButton();
					for (Button button : buttons) {
						// 删除按钮,按钮与角色关系
						buttonService.deleteButtonByButtonCode(button
								.getButtonCode());
					}
				}
				// 删除菜单,菜单与角色关系
				sysMenuService.deleteMenuById(menu.getId());
			}
			result.setResult(HttpStatus.OK);
			// 写入操作日志
			operationLogService.logOptAsync(OperationType.REMOVE,
					String.valueOf(id), Constant.OPRDATATYPE_MENU,
					getCurrentUser().id.longValue());
		} catch (Exception e) {
			result.setResult("300", "操作失败");
			LOGGER.info("Enter func[deleteById]" + e);

		}
		// 返回客户端信息，打印相关信息
		return result;
	}

	/**
	 * <登陆时显示登陆用户名>
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "getLoginUser", method = RequestMethod.GET)
	@ResponseBody
	public String loginUser(Model model) {
		ShiroUser user = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		StringBuilder sb = new StringBuilder();
		System.out.println("------------" + user.getName()
				+ "-------------------");
		sb.append("<li value='${user.name}' style='color: #b9ccda;'> ");
		sb.append("<a target='dialog' href='admin/user/update/");
		sb.append(user.id);
		sb.append("'>");
		sb.append(user.getName());
		sb.append("</a>");
		sb.append("，您好！</li>");
		// 退出
		sb.append("<li><a href='logout'>退出</a></li>");
		return sb.toString();
	}

	/**
	 * 获取根节点菜单树 parentId=0
	 * 
	 * @return 返回拼好的html
	 */
	@RequestMapping(value = "getRootMenu", method = RequestMethod.GET)
	@ResponseBody
	public String list() {
		ShiroUser user = getCurrentUser();
		Long userId = user.id;
		if (UserSessionManager.getInstance().checkKey(
				TagOrSessionConstants.SESSION_LOGINNAME, user.getLoginName())) {
			String sessionMenuPlay = String.valueOf(UserSessionManager
					.getInstance().get(
							TagOrSessionConstants.SESSION_MENUDISPLAY));
			if (StringUtils.isNotEmpty(sessionMenuPlay)) {
				LOGGER.info("get menuList from session!!!");
				LOGGER.info(sessionMenuPlay);
				return sessionMenuPlay;
			}
		}

		// 根据角色列表获取菜单列表
		List<SysMenu> menus = sysMenuService.getMenuByUserId(userId);
		String retStr = getMenuDivStr(menus);

		LOGGER.info("begin to set loginName and menuDispplay");
		UserSessionManager.getInstance().put(
				TagOrSessionConstants.SESSION_LOGINNAME, user.getLoginName());
		UserSessionManager.getInstance().put(
				TagOrSessionConstants.SESSION_MENUDISPLAY, retStr);
		LOGGER.info("end to set loginName and menuDispplay");

		return retStr;
	}

	private String getMenuDivStr(List<SysMenu> menus) {
		StringBuilder ret = new StringBuilder();

		for (SysMenu menu : menus) {
			ret.append("<div class='accordionHeader'><h2><span>Folder</span>");
			ret.append(menu.getName());
			ret.append("</h2></div>");
			ret.append("<div class='accordionContent'>");
			ret.append("<ul class='tree treeFolder'>");

			if (!CollectionUtils.isEmpty(menu.getChildMenus())) {
				ret.append(getChildMenuDivStr(menu.getChildMenus()));
			}

			ret.append("</ul>");
			ret.append("</div>");
		}

		return ret.toString();
	}

	private String getChildMenuDivStr(List<SysMenu> childMenus) {
		StringBuilder ret = new StringBuilder();

		for (SysMenu menu : childMenus) {
			ret.append("<li><a href='" + menu.getLink()
					+ "' target='navTab' rel='" + menu.getAlias() + "'>");
			ret.append(menu.getName());
			ret.append("</a>");
			if (!CollectionUtils.isEmpty(menu.getChildMenus())) {
				ret.append("<ul>");
				ret.append(getChildMenuDivStr(menu.getChildMenus()));
				ret.append("</ul>");
			}
			ret.append("</li>");
		}
		return ret.toString();
	}

	/**
	 * <查询SystemDic信息>
	 * 
	 * @param type
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "getSystemDicByType")
	@ResponseBody
	public List<List> getSystemDicByType(@RequestParam("type") String type) {
		List<List> result = new ArrayList<List>();
		List<String> list = null;
		List<SystemDic> dicList = systemDicService.getDicListByType(type);
		for (SystemDic dic : dicList) {
			list = new ArrayList<String>();
			list.add(dic.getValue() + "");
			list.add(dic.getName());
			result.add(list);
		}
		return result;
	}
}
