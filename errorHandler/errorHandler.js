class ErrorHandler extends Error{
    constructor(status, message) {
        super();

        this.status = status;
        this.message = message;
    }

    // TODO STACK TRACE TO DB AND GIVE TO CLIENT A CODE OF ERROR

    static badRequest(message) {
        return new ErrorHandler(404, "["+ this.caller.name +"] " + message);
    }

    static internal(message) {
        return new ErrorHandler(500, "["+ this.caller.name +"] " + message);
    }

    static forbidden(message) {
        return new ErrorHandler(403, "["+ this.caller.name +"] " + message);
    }
}


module.exports = ErrorHandler;