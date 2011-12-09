package se.uu.library

class User {

   String userId
   Date lastLogin

   static constraints = {
      userId(blank: false, unique: true)
      lastLogin(nullable:true)
   }

    static hasMany = [reviews:Review]

}
