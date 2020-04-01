
DO $$
    BEGIN
        RAISE NOTICE 'Add new columns to market.tblimages';
    END;
$$;
DO $$
    BEGIN

        IF (SELECT to_regclass('market.tblimages') IS NOT NULL)
        THEN
            IF NOT EXISTS
                (SELECT *
                 FROM information_schema.columns
                 WHERE table_schema = 'market' AND
                       table_name = 'tblimages' AND
                       column_name = 'categoryid')
                THEN
                    ALTER TABLE market.tblimages
                    ADD COLUMN CategoryId INT ;

                RAISE NOTICE 'Added CategoryId to market.tblimages';
            ELSE
                RAISE NOTICE 'market.tblimages already had CategoryId column';
            END IF;
        END IF;
    END;

$$ LANGUAGE plpgsql;
