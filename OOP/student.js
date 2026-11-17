class Student extends Person {
  schoolYear;

  constructor(firstName, lastName, gender, schoolYear) {
    super(firstName, lastName, gender);

    this.schoolYear = schoolYear;
  }
}
