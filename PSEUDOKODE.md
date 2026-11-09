### GET /houses

1. Modtager requesten.
2. Beder houses repository om alle houses.
3. Returner listen med status `200`(200 OK).
4. Returner `500` (500 Internal Server Error), hvis databasen fejler uventet.

### GET /houses/:id

1. Læs `id` fra URL'en.
2. Bed houses repository om et house med det ID.
3. Returner huset med status `200` (200 OK).
4. Returner `404` (404 Not Found), hvis huset ikke findes baseret på ID'et.

## Teachers

### GET /teachers

1. Modtager requesten.
2. Bed teachers repository om alle teachers.
3. Returner listen med status `200`(200 OK).
4. Returner `500` (500 Internal Server Error), hvis databasen fejler uventet.

### GET /teachers/:id

1. Læs `id` fra URL'en.
2. Bed teachers repository om en teacher med det ID.
3. Returner læreren med status `200` (200 OK).
4. Returner `404` (404 Not Found), hvis læreren ikke findes baseret på ID'et.

### POST /teachers

1. Læs `id`, `name`,`house_id` og `courses_id` fra request body.
2. Bed teachers repository om at oprette en teacher.
3. Returner den nye teacher med status `202` (202 Accepted).
4. Returner `400` (400 Bad Request), hvis `house_id` ikke findes.

### PUT /teachers/:id

1. Læs `id` fra URL'en.
2. Læs `name`, `house_id` og `courses_id` fra request body.
3. Bed teachers repository om at opdatere teacheren.
4. Returner den opdaterede teacher med status `200` (200 OK).
5. Returner `404` (404 Not Found), hvis teacheren ikke findes.

### DELETE /teachers/:id

1. Læs `id` fra URL'en.
2. Bed teachers repository om at slette teacheren.
3. Returner `200` (200 OK), hvis teacheren blev slettet. Med beskeden: Sayonara (Goodbye in japanese) teacher
4. Returner `500` (500 Internal Server Error), hvis teacheren ikke findes.

## Students

### GET /students

1. Modtager requesten.
2. Bed students repository om alle students.
3. Returner listen med status `200`.
4. Returner `404`, hvis databasen fejler uventet.

### GET /students/:id

1. Læs `id` fra URL'en.
2. Bed students repository om en student med det ID.
3. Returner eleven med status `200`.
4. Returner `404`, hvis eleven ikke findes.

### POST /students

1. Læs `name`, `semester` og `house_id` fra request body.
2. Bed students repository om at oprette en student.
3. Returner den nye student med status `201`.
4. Returner `400`, hvis `house_id` ikke findes eller semester er under 1.

### PUT /students/:id

1. Læs `id` fra URL'en.
2. Læs `name`, `semester` og `house_id` fra request body.
3. Bed students repository om at opdatere studenten.
4. Returner den opdaterede student med status `200`.
5. Returner `404`, hvis studenten ikke findes.

### DELETE /students/:id

1. Læs `id` fra URL'en.
2. Bed students repository om at slette studenten.
3. Returner `200` (200 OK), hvis teacheren blev slettet. Med beskeden: Sayonara (Goodbye in japanese) student-kun-chan
4. Returner `500`, hvis studenten ikke findes baseret på ID'et.

## Courses

### GET /courses

1. Modtager requesten.
2. Bed courses repository om alle courses.
3. Returner listen med status `200`.
4. Returner `500`, hvis databasen fejler uventet.

### GET /courses/:id

1. Læs `id` fra URL'en.
2. Bed courses repository om et course med det ID.
3. Returner kurset med status `200`.
4. Returner `404`, hvis kurset ikke findes.
5. Returner `500`, hvis der er problemer med databasen.

### POST /courses

1. Læs `name` og `teacher_id` fra request body.
2. Bed courses repository om at oprette et course.
3. Returner det nye course med status `202`.
4. Returner `500`, hvis der er problemer med databasen.

### PUT /courses/:id

1. Læs `id` fra URL'en.
2. Læs `name` og `teacher_id` fra request body.
3. Bed courses repository om at opdatere kurset.
4. Returner det opdaterede course med status `202`.
5. Returner `500`, hvis der er problemer med databasen.

### DELETE /courses/:id

1. Læs `id` fra URL'en.
2. Bed courses repository om at slette kurset.
3. Returner `202`, hvis kurset blev slettet.
4. Returner `500`, hvis der er problemer med databasen.
