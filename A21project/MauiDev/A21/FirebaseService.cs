using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Firebase.Database;
using Firebase.Database.Query;
using Microsoft.Maui.Storage;

namespace A21
{
    
    public class FirebaseService
    {
        private readonly FirebaseClient serviceRead;
        public FirebaseService() 
        {
            serviceRead = new FirebaseClient("https://footballteam-6839b-default-rtdb.europe-west1.firebasedatabase.app/");

        }
        public async Task<List<T>> GetAllAsync<T>()
        {
            var items = await serviceRead.Child(typeof(T).Name)
                                       .OnceAsync<T>();
            return items.Select(item => item.Object).ToList();
        }
    }
}
