class Iteration
  class Analysis
    class Init
      include Mandate

      def initialize(iteration_uuid, language_slug, exercise_slug, version_slug = nil)
        @iteration_uuid = iteration_uuid
        @language_slug = language_slug
        @exercise_slug = exercise_slug
        @version_slug = version_slug
      end

      def call
        RestClient.post "#{orchestrator_url}/iterations", {
          iteration_uuid: iteration_uuid,
          language_slug: language_slug,
          exercise_slug: exercise_slug,
          version_slug: version_slug
        }
      end
      
      private
      attr_reader :iteration_uuid, :language_slug, :exercise_slug, :version_slug

      def orchestrator_url
        Exercism.config.analyzer_orchestrator_url
      end
    end
  end

end
