package ra.springmvc_db_hibernate.dao;

import ra.springmvc_db_hibernate.entity.Student;

import java.util.List;

public interface StudentDAO {
    public List<Student> getStudents();
    public Student getStudentById(Integer stuId);
    public boolean insertStudent(Student stu);
    public boolean updateStudent(Student stu);
    public boolean deleteStudent(Integer stuId);
    public List<Student> getStudentsByName(String name);
}
