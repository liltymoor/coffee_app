class AccessController
{
    async login(req, res)
    {
        res.json({message: "api in progress"})
    }

    async isAuth(req, res)
    {
        res.json({message: "api in progress"})
    };

}

module.exports = new AccessController();