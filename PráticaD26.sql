1: 

    SELECT users.id, users.name, cities.name AS city 
    FROM users JOIN cities ON cities.id = users."cityId" 
    WHERE cities.name = 'Rio de Janeiro';

2:

    SELECT TESTIMONIALS.ID,
        U1.ID AS WRITER,
        U2.ID AS RECIPIENT,
        TESTIMONIALS.MESSAGE
    FROM TESTIMONIALS
    JOIN USERS U1 ON TESTIMONIALS."writerId" = U1.ID
    JOIN USERS U2 ON TESTIMONIALS."recipientId" = U2.ID;

3:

    SELECT USERS.ID,
        USERS.NAME,
        COURSES.NAME AS COURSE,
        SCHOOLS.NAME AS SCHOOL,
        EDUCATIONS."endDate"
    FROM USERS
    JOIN EDUCATIONS ON USERS.ID = EDUCATIONS."userId"
    JOIN COURSES ON EDUCATIONS."courseId" = COURSES.ID
    JOIN SCHOOLS ON EDUCATIONS."schoolId" = SCHOOLS.ID
    WHERE USERS.ID = 30
	AND EDUCATIONS.STATUS = 'finished';

4:

    SELECT USERS.ID AS ID,
        USERS.NAME,
        EXPERIENCES."startDate",
        ROLES.NAME AS ROLE
    FROM EXPERIENCES
    JOIN USERS ON EXPERIENCES."userId" = USERS.ID
    JOIN ROLES ON EXPERIENCES."roleId" = ROLES.ID
    WHERE experiences."userId" = 50
	AND experiences."endDate" IS NULL;
