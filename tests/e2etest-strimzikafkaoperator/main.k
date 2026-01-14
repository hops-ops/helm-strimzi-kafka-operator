import models.io.crossplane.apiextensions.v1 as apiextensions

e2etest = apiextensions.E2ETest {
    metadata.name = "e2etest-strimzikafkaoperator"
    spec = {
        compositionPath = "../../apis/strimzikafkaoperators/composition.yaml"
        xrdPath = "../../apis/strimzikafkaoperators/definition.yaml"
        timeoutSeconds = 300
        skipDelete = False
        claimPath = "claim.yaml"
    }
}
