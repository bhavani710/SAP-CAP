using my.bookshop as my from '../db/data-model';
using demo from '../db/schema';

service ProjectService @(path: '/ProjectService')
{
entity Users as select from demo.Users;
entity Projects as select from demo.Projects;
entity User1             as
        select
            id,
            name,
            gender,
            case when gender = 'female'
                then
                    'FEMALE'
                else
                    'MALE'
            end as CalculatedColumn:String(10)
 
    from demo.Users;

        entity UserContactDetail as
        projection on demo.Users
        excluding {
            name,
            gender
        };

}
service CatalogService {
    entity Books as projection on my.Books;
}
