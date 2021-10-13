package pl.lupin.lambda;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import com.amazonaws.services.s3.model.PutObjectResult;

import pl.lupin.lambda.DumpJava8AL2;

public class DumpJava8AL2_x86_64 implements RequestHandler<Object, PutObjectResult> {
    @Override
    public PutObjectResult handleRequest(Object input, Context context) {
        DumpJava8AL2 dump = new DumpJava8AL2();
        return dump.handle(input, context, "x86_64");
    }
}
