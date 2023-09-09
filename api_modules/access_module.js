class AccessController
{
    async login(req, res)
    {
        
    }

    async isAuth(req, res)
    {
        res.json({message: "api in progress"})
    };

}

module.exports = new AccessController();