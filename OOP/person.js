class Person {
  firstName;
  lastName;
  gender;
  spouse;

  constructor(firstName, lastName, gender) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.gender = gender;
    this.spouse = null;
  }

  get fullName() {
    return this.firstName + " " + this.lastName;
  }

  isMarried() {
    // return true hvis spouse ikke er null, eller false
    return this.spouse != null;
  }

  marry(otherPerson) {
    this.spouse = otherPerson;
    otherPerson.spouse = this;

    // Når to personer bliver gift
    // Skal kvinden "female" tage mandens "male" efternavn

    /*
    Tjek this.spouse's køn

    Hvis mand:
    Hvis otherPerson er kvinde, får kvinden thisPerson's efternavn
    Hvis otherPerson er en mand, sker der ikke noget.

    Hvis kvinde:
    Hvis otherPerson er mand, tager this.person deres efternavn
    Hvis otherPersone er kvinde, sker der ikke noget.

    */

    if (this.gender === "Male" && otherPerson.gender === "Female") {
      otherPerson.lastName = this.lastName;
    } else if (this.gender === "Female" && otherPerson.gender === "Male") {
      this.lastName = otherPerson.lastName;
    } else if (this.gender === "Female" && otherPerson.gender === "Female") {
      // Hvis begge er kvinder, sker der ikke noget
    } else if (this.gender === "Male" && otherPerson.gender === "Male") {
      // Hvis begge er mænd, sker der ikke noget
    }

    return `${this.firstName} is now married to ${otherPerson.firstName}`;
  }
}

const p1 = new Person("Harry", "Potter", "Male", "true");
const p2 = new Person("Ginny", "Weasley", "Female", "true");
const p3 = new Person("Ron", "Weasley", "Male", "false");
