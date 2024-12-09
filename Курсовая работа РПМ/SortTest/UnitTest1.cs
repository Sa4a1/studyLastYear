using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using ProjectOrg;
using System.Linq;
using System.Collections.Generic;

namespace SortTest
{
    [TestClass]
    public class UnitTest1
    {
        [TestClass]
        public class SortWorkersTests
        {
          
            private readonly List<Workers> _testData = new List<Workers>()
        {
            new Workers() { WorkerID = 1, DepartmentID = 5 },
            new Workers() { WorkerID = 2, DepartmentID = 2 },
            new Workers() { WorkerID = 3, DepartmentID = 3 },
            new Workers() { WorkerID = 4, DepartmentID = 4 },
            new Workers() { WorkerID = 5, DepartmentID = 5 },
            new Workers() { WorkerID = 6, DepartmentID = 5 },
            new Workers() { WorkerID = 7, DepartmentID = 2 },
            new Workers() { WorkerID = 8, DepartmentID = 3 },
            new Workers() { WorkerID = 9, DepartmentID = 5 },
            new Workers() { WorkerID = 10, DepartmentID = 5 }
        };

            // Создание экземпляра класса SortWorkers
            private readonly SortWorkers _sortWorkers = new SortWorkers();

         
            [TestMethod]
            public void FiltWorkers_NoFilter_ReturnsAllWorkers()
            {
                var result = _sortWorkers.FiltWorkers(_testData, 0);

                Assert.AreEqual(_testData.Count, result.Count); 
            }

          
            [TestMethod]
            public void FiltWorkers_FilterByDepartmentId1_ReturnsCorrectWorkers()
            {
                var expectedResult = _testData.Where(w => w.DepartmentID == 1).ToList();
                var result = _sortWorkers.FiltWorkers(_testData, 1);

                Assert.AreEqual(0, result.Count);
  
            }

           
            [TestMethod]
            public void FiltWorkers_FilterByDepartmentId2_ReturnsCorrectWorkers()
            {
                var expectedResult = _testData.Where(w => w.DepartmentID == 2).ToList();
                var result = _sortWorkers.FiltWorkers(_testData, 2);

                Assert.AreEqual(2, result.Count);
           
            }

            [TestMethod]
            public void FiltWorkers_FilterByDepartmentId3_ReturnsCorrectWorkers()
            {

                var result = _sortWorkers.FiltWorkers(_testData, 3);

                Assert.AreEqual(2, result.Count);

            }

            [TestMethod]
            public void FiltWorkers_FilterByDepartmentId4_ReturnsCorrectWorkers()
            {
                var result = _sortWorkers.FiltWorkers(_testData, 4);

                Assert.AreEqual(1, result.Count);
      
            }

            [TestMethod]
            public void FiltWorkers_FilterByDepartmentId5_ReturnsCorrectWorkers()
            {
                var result = _sortWorkers.FiltWorkers(_testData, 5);

                Assert.AreEqual(5, result.Count);
            }
        }
    }
}
