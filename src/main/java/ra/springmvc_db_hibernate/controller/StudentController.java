package ra.springmvc_db_hibernate.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import ra.springmvc_db_hibernate.dao.StudentDAO;
import ra.springmvc_db_hibernate.entity.Student;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class StudentController {
    @Autowired
    private StudentDAO studentDAO;

//    @InitBinder
//    public void initBinder(WebDataBinder binder){
//        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
//        binder.registerCustomEditor(Date.class,new CustomDateEditor(sf,false));
//    }

    @RequestMapping(value = {"/","/initInsertStudent"})
    public String initInsertStudent(Model model){
        Student s = new Student();
        model.addAttribute("s",s);
        return "addStudent";
    }

    @RequestMapping("/insertStudent")
    public String insertStudent(@ModelAttribute("s")Student stu, Model model){
        boolean bl = studentDAO.insertStudent(stu);
        if(bl){
            return "redirect:/loadStudents"; //Gọi tiếp tới method trên controller
        }else{
            model.addAttribute("err","Insert failed!");
            model.addAttribute("s",stu);
            return "addStudent";
        }
    }

    @RequestMapping("/loadStudents")
    public String loadStudents(Model model){
        List<Student> list = studentDAO.getStudents();
        model.addAttribute("list",list);
        return "listStudent";
    }
}
