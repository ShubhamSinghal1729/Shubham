public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer intvar,String second) {
        List<Contact> listofContact = new List<Contact>();
        for(Integer i =0 ; i< intvar ; i++){
            Contact con = new Contact();
            con.FirstName = String.valueof(i);
            con.LastName = second;
            listofContact.add(con);
        }
      //  insert listofContact;
        return listofContact;
    }
}