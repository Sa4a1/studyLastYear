using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media.TextFormatting;

namespace ProjectOrg
{
    public class SortWorkers
    {
        public List<Workers> FiltWorkers(List<Workers>workers,int selectedIndex)
        {
            if(selectedIndex == 0) return workers;
            if(selectedIndex == 1) workers = workers.Where(p => (p.DepartmentID == 1)).ToList();
            if(selectedIndex == 2) workers = workers.Where(p => (p.DepartmentID == 2)).ToList();
            if(selectedIndex == 3) workers = workers.Where(p => (p.DepartmentID == 3)).ToList();
            if(selectedIndex == 4) workers = workers.Where(p =>(p.DepartmentID == 4)).ToList();
            if(selectedIndex == 5) workers = workers.Where(p =>(p.DepartmentID== 5)).ToList();

            return workers;
        }
    }
}
