/*
   Copyright (C) 2012 Ghazi Triki <ghazi.nocturne@gmail.com>

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
package com.alkiteb.bahth
{
    import flexunit.framework.Assert;

    public class ArabicStringUtilsTest
    {
        
        var basmalahWithDiacritics : String;
        var basmalahWithoutDiacritics : String;
        var bismWithoutDiacritics : String;

        [Before]
        public function setUp() : void
        {
            basmalahWithDiacritics = "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ";
            basmalahWithoutDiacritics = "بسم الله الرحمن الرحيم";
            bismWithoutDiacritics = "بسم";
        }

        [After]
        public function tearDown() : void
        {
        }

        [BeforeClass]
        public static function setUpBeforeClass() : void
        {
        }

        [AfterClass]
        public static function tearDownAfterClass() : void
        {
        }

        [Test]
        public function search() : void
        {
            var bismSearchResult : Array = ArabicStringUtils.search(basmalahWithDiacritics, bismWithoutDiacritics);
            Assert.assertNotNull(bismSearchResult);
            Assert.assertEquals(bismSearchResult.length, 1)
            
            var rhSearchResult = ArabicStringUtils.search(basmalahWithDiacritics, "رح");
            Assert.assertNotNull(rhSearchResult);
            Assert.assertEquals(rhSearchResult.length, 2)
            for each ( var result : Object in rhSearchResult )
            {
                Assert.assertEquals(result.length, 5);
            }
        }
        
        [Test]
        public function removeDiacritics() : void
        {
            Assert.assertEquals(ArabicStringUtils.removeDiacritics(basmalahWithDiacritics), basmalahWithoutDiacritics);
        }

    }
}
