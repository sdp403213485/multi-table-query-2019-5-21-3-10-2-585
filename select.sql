# 1.查询同时存在1课程和2课程的情况
		SELECT DISTINCT `name`,age,sex,id FROM student
		RIGHT JOIN student_course ON student.id = student_course.studentId WHERE courseId IN(1,2);

# 2.查询同时存在1课程和2课程的情况
		select a.* from  student a,student_course b,student_course c
 		where a.id = b.studentId and a.id = c.studentId and b.courseId = '1' and c.courseId = '2';
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
		select a.* from  student a,student_course b,student_course c
 		where a.id = b.studentId and a.id = c.studentId and b.courseId = '1' and c.courseId = '2';
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
		SELECT * FROM student WHERE id not in (select studentId FROM student_course);
# 5.查询所有有成绩的SQL
		SELECT * FROM student WHERE id  in (select studentId FROM student_course);
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
		select * from student where id in (select t1.studentId from student_course
		 t1,student_course t2 where t1.studentId = t2.studentId and t1.courseId = '1' and t2.courseId = '2');
# 7.检索1课程分数小于60，按分数降序排列的学生信息
		SELECT id,name,age,sex FROM student RIGHT JOIN student_course ON student.id=student_course.studentId 
		WHERE courseId='1' AND score<'60'
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
		select name,AVG(score) FROM course RIGHT JOIN student_course ON
		 id=courseId GROUP BY courseId ORDER BY AVG(score) DESC,courseId ASC
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
		SELECT student.name,score FROM  student,
		(SELECT studentId,score,courseId FROM student_course RIGHT JOIN
		 course ON student_course.courseId=course.id AND course.name='数学'
		  AND score<60) as t WHERE id = t.studentId
