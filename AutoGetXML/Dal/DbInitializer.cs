using AutoGetXML.Model;
using System.Data.Entity;

namespace AutoGetXML.DAL
{
    public class InitializerForDropCreateDatabaseAlways : DropCreateDatabaseAlways<MysqlDbContext>
    {
        public InitializerForDropCreateDatabaseAlways()
            : base()
        { }

        protected override void Seed(MysqlDbContext context)
        {
            base.Seed(context);
        }
    }

    public class InitializerForCreateDatabaseIfNotExists : CreateDatabaseIfNotExists<MysqlDbContext>
    {
        //public InitializerForCreateDatabaseIfNotExists()
        //    : base()
        //{
        //}
        protected override void Seed(MysqlDbContext context)
        {
           
            base.Seed(context);
        }
    }

    public class InitializerForDropCreateDatabaseIfModelChanges : DropCreateDatabaseIfModelChanges<MysqlDbContext>
    {
        protected override void Seed(MysqlDbContext context)
        {
        }
    }
}