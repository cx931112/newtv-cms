package net.chinaott.cms.web.module.account.web;

import net.chinaott.cms.core.system.entity.User;
import net.chinaott.cms.core.system.entity.UserRoleRel;
import net.chinaott.cms.web.common.constant.Constant;
import net.chinaott.cms.web.log.entity.OperationType;
import net.chinaott.cms.web.module.account.service.AccountService;
import net.chinaott.cms.web.module.account.service.ShiroDbRealm.ShiroUser;
import net.chinaott.cms.web.module.log.service.OperationLogService;
import net.chinaott.cms.web.module.system.service.RoleManageService;
import net.chinaott.cms.web.utils.web.HttpResult;
import net.chinaott.cms.web.utils.web.HttpStatus;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户注册的Controller.
 * 
 * @author mahc
 */
@Controller
@RequestMapping(value = "/register")
public class RegisterController
{
    
    @Autowired
    private AccountService accountService;
    
    
    
    @Autowired
    private RoleManageService roleService;
    
    @Autowired
    private OperationLogService operationLogService;
    
    /**
     * 日志
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(UserAdminController.class);
    
    @RequestMapping(value = "save")
    @ResponseBody
    public HttpResult register(@Valid User user, HttpServletRequest request, HttpServletResponse response)
    {
        HttpResult result = new HttpResult();
        try
        {
            accountService.registerUser(user);
            // 执行成功则 返回信息 为 SUCCESS
            result.setResult(HttpStatus.OK);
//            CodeShangHai codeShangHai=new CodeShangHai();
//            codeShangHai.setCodeId(2L);
//            codeShangHai.setCodeNum(user.getName());
//            codeMangerShangHaiRepository.insertCodeShangHai(codeShangHai);
//            
//            codeMangerSiChuanRepository.insertCodeShangHai(codeShangHai);
            
//            SiChuanCarrierModel siChuanCarrierModel=siChuanCarrierModelService.findById("564980ebfb275cf66b3fd48f"); 
//            System.out.println("---"+siChuanCarrierModel.get_id()+"--"+siChuanCarrierModel.getBatch_code());
            
            // 写入操作日志
            operationLogService.logOptAsync(OperationType.ADD,
                String.valueOf(user.getId()),
                Constant.OPRDATATYPE_USER,
                getCurrentUser().id.longValue());
        }
        catch (Exception e)
        {
            // 执行失败则 返回信息 为 ERROR
            result.setResult("300", "操作失败");
            if (LOGGER.isErrorEnabled())
            {
                LOGGER.info("Enter func[RegisterController.register]" + e);
            }
        }
        // 页面返回信息
        return result;
    }
    
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String registerForm(ModelMap model)
    {
        List<UserRoleRel> rel = new ArrayList<UserRoleRel>();
        boolean isAdmin = false;
        Long adminRole = 1L;
        rel = roleService.getUserRoleRel(getCurrentUser().id);
        for (UserRoleRel r : rel)
        {
            if (adminRole == r.getRoleId())
            {
                isAdmin = true;
            }
        }
        return "account/register";
    }
    
    /**
     * Ajax请求校验loginName是否唯一。
     */
    @RequestMapping(value = "checkLoginName")
    @ResponseBody
    public String checkLoginName(@RequestParam("loginName") String loginName)
    {
        if (accountService.findUserByLoginName(loginName) == null)
        {
            return "true";
        }
        else
        {
            return "false";
        }
    }
    
    /**
     * 取出Shiro中的当前用户.
     */
    private ShiroUser getCurrentUser()
    {
        ShiroUser user = (ShiroUser)SecurityUtils.getSubject().getPrincipal();
        return user;
    }
}
